#include <iostream>
#include <vector>
#include <future>
#include <thread>
#include <algorithm>
#include <cmath>

/**
 * Функция слияния двух отсортированных частей массива
 * param arr - сортируемый массив
 * param l - левая граница первой части
 * param m - средняя точка (конец первой части)
 * param r - правая граница второй части
 */
void merge(int* arr, int l, int m, int r) {
   int nl = m - l + 1;
   int nr = r - m;
   
   // создаем временные массивы
   int* left = new int[nl];
   int* right = new int[nr];
   
   // копируем данные во временные массивы
   for (int i = 0; i < nl; i++)
       left[i] = arr[l + i];
       
   for (int j = 0; j < nr; j++)
       right[j] = arr[m + 1 + j];
       
   int i = 0, j = 0;
   int k = l;  // начало левой части
   
   while (i < nl && j < nr) {
       // записываем минимальные элементы обратно во входной массив
       if (left[i] <= right[j]) {
           arr[k] = left[i];
           i++;
       }
       else {
           arr[k] = right[j];
           j++;
       }
       k++;
   }
   
   // записываем оставшиеся элементы левой части
   while (i < nl) {
       arr[k] = left[i];
       i++;
       k++;
   }
   
   // записываем оставшиеся элементы правой части
   while (j < nr) {
       arr[k] = right[j];
       j++;
       k++;
   }
   
   // освобождаем память
   delete[] left;
   delete[] right;
}

/**
 * Многопоточная сортировка слиянием
 * param arr - сортируемый массив
 * param l - начало сортируемой части
 * param r - конец сортируемой части
 * param depth - текущая глубина рекурсии
 * param maxThreads - максимальное количество потоков
 * param activeThreads - указатель на счётчик активных потоков
 * param mtx - мьютекс для синхронизации доступа к счётчику потоков
 */
void parallelMergeSort(int* arr, int l, int r, 
                       int depth, int maxThreads, 
                       int* activeThreads, 
                       std::mutex* mtx) {
    // Базовый случай: если осталось меньше 2-х элементов, выходим из рекурсии
    if (l >= r) {
        return;
    }
    
    // Вычисляем среднюю точку
    int m = l + (r - l) / 2; // Исправлена формула вычисления середины
    
    // Проверяем, можем ли мы запустить новый поток
    bool canStartNewThread = false;
    if (depth > 0) { // На верхних уровнях рекурсии используем многопоточность
        mtx->lock();
        if (*activeThreads < maxThreads) {
            (*activeThreads)++;
            canStartNewThread = true;
        }
        mtx->unlock();
    }
    
    if (canStartNewThread) {
        // Запускаем левую часть в отдельном потоке через std::async
        std::future<void> leftFuture = std::async(
            std::launch::async,
            [arr, l, m, depth, maxThreads, activeThreads, mtx]() {
                parallelMergeSort(arr, l, m, depth - 1, maxThreads, activeThreads, mtx);
                // Уменьшаем счётчик активных потоков по завершении
                mtx->lock();
                (*activeThreads)--;
                mtx->unlock();
            }
        );
        
        // Правую часть сортируем в текущем потоке
        parallelMergeSort(arr, m + 1, r, depth - 1, maxThreads, activeThreads, mtx);
        
        // Ждем завершения левого потока
        leftFuture.wait();
    } else {
        // Если нельзя создать новый поток, выполняем последовательно
        parallelMergeSort(arr, l, m, depth - 1, maxThreads, activeThreads, mtx);
        parallelMergeSort(arr, m + 1, r, depth - 1, maxThreads, activeThreads, mtx);
    }
    
    // Объединяем отсортированные части
    merge(arr, l, m, r);
}

/**
 * Обертка для вызова многопоточной сортировки слиянием
 * param arr - сортируемый массив
 * param n - размер массива
 * param maxThreads - максимальное количество потоков (по умолчанию = количество аппаратных потоков)
 */
void parallelMergeSort(int* arr, int n, int maxThreads = std::thread::hardware_concurrency()) {
    if (n <= 1) return;
    
    // Определяем максимальную глубину рекурсии для создания потоков
    // Обычно это логарифм от размера массива по основанию 2
    int maxDepth = std::min(static_cast<int>(std::log2(maxThreads)) + 1, 
                           static_cast<int>(std::log2(n)));
    
    int activeThreads = 0;
    std::mutex mtx;
    
    // Запускаем сортировку с начальной глубиной
    parallelMergeSort(arr, 0, n-1, maxDepth, maxThreads, &activeThreads, &mtx);
}

// Пример использования
int main() {
    int arr[] = {12, 11, 13, 5, 6, 7, 1, 8, 9, 10, 4, 3, 2};
    int n = sizeof(arr) / sizeof(arr[0]);
    
    std::cout << "Исходный массив: ";
    for (int i = 0; i < n; i++)
        std::cout << arr[i] << " ";
    std::cout << std::endl;
    
    // Вызываем многопоточную сортировку слиянием с ограничением в 4 потока
    parallelMergeSort(arr, n, 4);
    
    std::cout << "Отсортированный массив: ";
    for (int i = 0; i < n; i++)
        std::cout << arr[i] << " ";
    std::cout << std::endl;
    
    return 0;
}
