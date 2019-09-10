import argparse
from funciones import suma_atentados


def get_args(argv=None):
	parser = argparse.ArgumentParser(description="Obtén el número de atentados registrados en un año en Nueva York y el número de personas fallecidas en los mismos.")
	parser.add_argument("-y", "--year", type=int, default=2001, help="add a year")

	return parser.parse_args()



def main():
	
	parser = get_args()
	print("respuesta -->", parser.suma_atentados(year))





if __name__ == "__main__":
    main()