import argparse
from clear import data_clear 
from analytic import compare_city,compare_state,compare_restaurant
from pdf import PDF
import os

url = os.path.dirname(os.path.abspath(__file__))

def parse():
    parser = argparse.ArgumentParser()                 # analizador de argumentos
    #grupo que limpia 
    grupo = parser.add_mutually_exclusive_group()      # grupo mutuamente excluyente (solo una operacion)
    grupo.add_argument('-c', '--clear', help='Limpia el dataset y lo deja prepardo para el analisis',action='store_true')           # action guarda el argumento
    grupo.add_argument('-ac',action='append', dest='cities',default=[],help="Añade las ciudades que se quiere comparar. Ej: -ac 'New York' -ac Phoenix ...")
    grupo.add_argument('-as',action='append', dest='states',default=[],help="Añade los estados que se quiere comparar. Ej: -as California -as 'New York' ...")
    grupo.add_argument('-at',action='store', dest='type',default=[],help="Indica que tipo de restaurante se pide mas en una ciudad (pizza o hamburguesa)")

    #parser.add_argument('string1', help='Primer numero de la operacion.',type=str)
    return parser.parse_args()


def main(): 

    args=parse()

    # opciones
    pdf = PDF()
    pdf.input_title()
    if args.clear:
        data_clear(pdf)
    elif args.cities:
        compare_city(args.cities,pdf)
    elif args.states:
        compare_state(args.states,pdf)
    elif args.type:
        compare_restaurant(pdf,args.type)
    else:
        print ('Error: se requiere uno o mas argumentos para realizar la accion. Pulsa -h para más información')
    
    url_pdf = url + "/../pdf/"
    pdf.output(url_pdf + "analytic.pdf", 'F')



if __name__=='__main__':
	main()
