import tkinter as tk
from tkinter import messagebox
from pyswip import Prolog

# Inicializar la conexión a Prolog
prolog = Prolog()
prolog.consult("datos_ususarios.pl") 

def registrar_usuario():
    nombre = entry_nombre.get()
    cursos = entry_cursos.get().split(",")  # Suponemos que los cursos se ingresan separados por comas

    # Verificar si el usuario ya existe en la base de datos
    if list(prolog.query(f"usuario({nombre}, _)")):
        messagebox.showerror("Error", "El usuario ya existe")
    else:
        # Agregar el usuario a la base de datos Prolog
        prolog.assertz(f"usuario({nombre}, {cursos})")
        messagebox.showinfo("Éxito", "Usuario registrado con éxito")

def iniciar_sesion():
    nombre = entry_nombre.get()

    # Verificar si el usuario existe en la base de datos
    if list(prolog.query(f"usuario({nombre}, _)")):
        # Mostrar una nueva ventana para agregar cursos aprobados
        ventana_iniciar_sesion = tk.Toplevel(root)
        label_curso = tk.Label(ventana_iniciar_sesion, text="Cursos Aprobados:")
        entry_curso = tk.Entry(ventana_iniciar_sesion)
        boton_agregar_curso = tk.Button(ventana_iniciar_sesion, text="Agregar Curso", command=lambda: agregar_curso(nombre, entry_curso.get()))
        label_curso.pack()
        entry_curso.pack()
        boton_agregar_curso.pack()
    else:
        messagebox.showerror("Error", "Usuario no encontrado")

def agregar_curso(nombre, curso):
    prolog.assertz(f"curso_aprobado({nombre}, {curso})")
    messagebox.showinfo("Éxito", f"Curso '{curso}' agregado con éxito")

# Crear la ventana principal
root = tk.Tk()
root.title("Sistema de Registro")

# Elementos de la interfaz
label_nombre = tk.Label(root, text="Nombre:")
label_cursos = tk.Label(root, text="Cursos Aprobados (separados por comas):")
entry_nombre = tk.Entry(root)
#entry_cursos = tk.Entry(root)
boton_registrar = tk.Button(root, text="Registrar Usuario", command=registrar_usuario)
boton_iniciar_sesion = tk.Button(root, text="Iniciar Sesión", command=iniciar_sesion)

# Colocar elementos en la ventana
label_nombre.pack()
entry_nombre.pack()
#
# label_cursos.pack()
#entry_cursos.pack()
boton_registrar.pack()
boton_iniciar_sesion.pack()

# Iniciar la aplicación
root.mainloop()
