#include <iostream>
#include <vector>

using namespace std;

void Number_One() {
	int counter_of_Day = 0;
	cout << "������� ���������� ���� �� �������: ";
	cin >> counter_of_Day;
	///
	int max_bought_of_eat = 0;
	cout << "������� ������������ ���������� ���, ������� ����� ������ � ����: ";
	cin >> max_bought_of_eat;
	///
	int eaten_of_food = 0;
	cout << "������� ���������� ���, ������� ���������� ������� � ����: ";
	cin >> eaten_of_food;
	///
	int cout_of_days = 1 ; // ���������� ���� ����� �� ������ � �������.
	int eaten_food_island = 0; // ���������� ��������� ���

	if (eaten_of_food > max_bought_of_eat) {  // �������� �� ���������� ������������ � ��������� ���
		cout << "������ ����������, � ���� �� ���������� ��� ������, ��� ����� ������ " << -1 << endl;
	}else {
		for (int i = 0; i < counter_of_Day; i++) {// ���������� �� ������� ���
			if (i % 7 != 0) { // ���� �� �����������
				if (eaten_food_island < eaten_of_food) { // ���� �������� ������ ��� ��� �����,�� ���� � ������� � �������� �
					eaten_food_island += max_bought_of_eat;
					cout_of_days++;
				}
			eaten_food_island -= eaten_of_food;
			}

		}
		cout << "����������� ���������� ����, ����� ����� �������� ��� � �������� ����� ������: " << cout_of_days << endl;
	}
}

void Number_Two() {
	cout << "������� ���������� ������: ";
	int number_of_flowers; //������ ���������� ������ �� ����
	cin >> number_of_flowers;
	cout << "������� ������� �����: ";
	int capacity_of_leica; 	//������ ������� �����
	cin >> capacity_of_leica;
	vector<int> watering_the_flower(number_of_flowers);// ���������, ������� ������ � ���� ������������ ����� ��� ������� ������

	int count_of_liter_in_leica = capacity_of_leica; // �������� ������ ������� �����
	int steps = 0;  // ���������� �����
	int x = -1; // ��������� �������
	int remain_in_leica = 0; // ������� � �����
	int water_in_leica = remain_in_leica + capacity_of_leica; // ��������� ���������� ���� � �����

	if (capacity_of_leica < 0) { // ���� ������������ ���� ������������� �������� � ������� �����
		cout << "������ ����� " << endl;
	}
	else {
		for (int j = 0; j < number_of_flowers; j++) {// ���� ��� ����� ������ ��� ������� ������
			cout << "������� ���������� ������ ������ " << j << " ��� ������: ";
			cin >> watering_the_flower[j];
		}
		for (int i = 0; i < number_of_flowers; i++) { // ���� ��� ������ ������� ������
			if (water_in_leica < watering_the_flower[i]) { // ������� �� �������� ������� �� ������� ����� ��� ������ ������
				steps += (i * 2); // ���� � ���� � ������������ �������
				capacity_of_leica = count_of_liter_in_leica; //��������� �����
			}
			water_in_leica = capacity_of_leica - watering_the_flower[i]; // �������� ������
			steps++; // ��� + 1 
			x++; // ��������� �� ��������� ������
		}
	}
	cout << "���������� ����� ��� ������ ���� ������: " << steps << endl;
}

void Number_Three() {
	cout << "������� ���������� �����: ";
	int n;
	cin >> n;
	int counter = 0; // ������� ����� ��� ����� ���� > 10

	for (int i = 0; i < n; i++) { // ���������� �� ������� ���������� �����
		int chislo;
		cin >> chislo;
		int sum = 0;
		while (chislo != 0) { // ����� ���� ���������� �����
			sum += chislo % 10;
			chislo /= 10;
		}
		if (sum > 10) { // ������� + 1
			counter++;
		}
	}
	cout << "���������� ����� ��� ����� ������ 10: " << counter;
}

int main() {
	setlocale(LC_ALL, "RUSSIAN");
	cout << "�������� ����� �������: ";
	int Exercise = 0;
	cin >> Exercise;
	switch (Exercise) { // �������� ����� ������� � ������� ��������� switch
	case 1:
		Number_One(); // �������� ������� � ������ Number_One, ���� �������� Exercise = 1.
		break;
	case 2:
		Number_Two();
		break;
	case 3:
		Number_Three();
		break;
	default:
		break;
	}
	return 0;
}


