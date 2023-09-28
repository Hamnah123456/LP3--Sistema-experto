import tkinter as tk
from tkinter import *
from tkinter import messagebox
from pyswip import Prolog


import tkinter as tk
from pyswip import Prolog

class VentanaPrincipal:
    def __init__(self, root):
        self.root = root
        self.root.geometry("600x600")
        self.root.title("Gestión de horarios")

        self.label = tk.Label(root, text="Seleccione una opción:")
        self.label.pack()

        self.registrar_button = tk.Button(root, text="Registrar", command=self.registrar)
        self.registrar_button.pack()

        self.iniciar_sesion_button = tk.Button(root, text="Iniciar Sesión", command=self.iniciar_sesion)
        self.iniciar_sesion_button.pack()

    def registrar(self):
        self.root.destroy()  # Cierra la ventana actual

        registro_window = tk.Tk()
        registro_window.title("Registro")

        self.nombre_label = tk.Label(registro_window, text="Nombre:")
        self.nombre_label.pack()
        self.nombre_entry = tk.Entry(registro_window)
        self.nombre_entry.pack()

        self.contraseña_label = tk.Label(registro_window, text="Contraseña:")
        self.contraseña_label.pack()
        self.contraseña_entry = tk.Entry(registro_window, show="*")
        self.contraseña_entry.pack()

        self.cursos_label = tk.Label(registro_window, text="Cursos aprobados (separados por comas):")
        self.cursos_label.pack()
        self.cursos_entry = tk.Entry(registro_window)
        self.cursos_entry.pack()

        self.registrar_button = tk.Button(registro_window, text="Registrar", command=self.registrar_usuario)
        self.registrar_button.pack()
        
    def registrar_usuario(self):
        nombre = self.nombre_entry.get()
        contraseña = self.contraseña_entry.get()
        cursos_aprobados = [curso.strip() for curso in self.cursos_entry.get().split(',')]

        # Agregar usuario a la base de datos Prolog
        self.prolog.assertz(f"usuario({nombre}, {contraseña}, {cursos_aprobados})")

        # Cerrar la ventana de registro
        self.root.destroy()


    def iniciar_sesion(self):
        self.root.destroy()  # Cierra la ventana actual

        inicio_sesion_window = tk.Tk()
        inicio_sesion_window.title("Inicio de Sesión")

        self.nombre_label = tk.Label(inicio_sesion_window, text="Nombre:")
        self.nombre_label.pack()
        self.nombre_entry = tk.Entry(inicio_sesion_window)
        self.nombre_entry.pack()

        self.contraseña_label = tk.Label(inicio_sesion_window, text="Contraseña:")
        self.contraseña_label.pack()
        self.contraseña_entry = tk.Entry(inicio_sesion_window, show="*")
        self.contraseña_entry.pack()

        self.iniciar_sesion_button = tk.Button(inicio_sesion_window, text="Iniciar Sesión", command=self.verificar_sesion)
        self.iniciar_sesion_button.pack()
        
    def verificar_sesion(self):
        nombre = self.nombre_entry.get()
        contraseña = self.contraseña_entry.get()

        # Verificar la sesión en la base de datos Prolog
        if list(self.prolog.query(f"usuario({nombre}, {contraseña}, _cursos)")):
            print("Inicio de sesión exitoso")
        else:
            print("Inicio de sesión fallido")

class VentanaCursos:
    def __init__(self, root, cursos_disponibles):
        self.root = root
        self.root.title("Selección de Cursos")

        # Lista de cursos disponibles
        self.cursos_disponibles = cursos_disponibles

        # Variables para el seguimiento de los cursos seleccionados
        self.cursos_seleccionados = []
        self.creditos_seleccionados = 0

        # Debes crear la interfaz gráfica para mostrar los cursos disponibles y permitir la selección

    #def mostrar_cursos(self):
        # Lógica para mostrar los cursos disponibles en la interfaz gráfica
        # Debes implementar la lógica aquí

    #def seleccionar_curso(self, curso):
        # Lógica para seleccionar un curso y actualizar los créditos seleccionados
        # Debes implementar la lógica aquí

    #def continuar(self):
        # Lógica para verificar los requisitos y permitir la continuación del proceso
        # Debes implementar la lógica aquí

# Código principal
#if __name__ == "__main__":
    root = tk.Tk()
    ventana_principal = VentanaPrincipal(root)
    root.mainloop()
