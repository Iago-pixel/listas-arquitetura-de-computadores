#include <iostream>

int main() {
    for(int i = 0; i < 64; i++) {
        std::cout << ".word";
        for(int j = 0; j < 876; j++) {
            std::cout << " 0x009290ff";
        }
        std::cout << std::endl;
    }

    return 0;
}