
# codigo guia de algunas opciones para usar tkinter

from pyswip import Prolog

import tkinter # ya se encuentra instalada en python

ventana = tkinter.Tk()
ventana.geometry("500x500") #tamaño de la ventana
ventana.title("Bienvenidos a Gestion de horarios UNALM para estadisticos")


boton_inicio_1 = tkinter.Button(ventana, 
                                text = "Registrar", 
                                width = 5, 
                                height = 2 )
                                #command = registro_usuario)
boton_inicio_1.grid(row = 2, column = 1)

boton_inicio_2 = tkinter.Button(ventana, text = "Iniciar secion", width = 5, height = 2 )
                                #command = iniciar_secion)
boton_inicio_2.grid(row = 1, column = 1)


cajaTexto = tkinter.Entry(ventana, font = "Helvetica 18")
cajaTexto.pack()

ventana.mainloop()