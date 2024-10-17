from pyswip import Prolog
import tkinter as tk
from tkinter import messagebox

# Inicializando o Prolog
prolog = Prolog()
prolog.consult("investimentos.pl")  # Certifique-se de que o arquivo está no mesmo diretório do script


# Função para sugerir investimentos e obter o perfil do investidor
def sugerir_investimentos(respostas):
    # Formatar as respostas para Prolog
    respostas_prolog = ", ".join(f"'{resposta}'" for resposta in respostas)

    # Consultar o perfil de risco
    perfil_query = f"perfil_risco([{respostas_prolog}], Perfil)"
    perfil_result = list(prolog.query(perfil_query))

    # Consultar as sugestões de investimento
    query = f"sugerir_investimentos([{respostas_prolog}], Sugestao)"
    result = list(prolog.query(query))

    perfil = perfil_result[0]['Perfil'] if perfil_result else "desconhecido"

    if result:
        # Capturar todas as sugestões
        sugestao = []
        for res in result:
            sugestao.extend(res['Sugestao'])
        return perfil, sugestao
    else:
        return perfil, None


# Função para capturar e processar as respostas do usuário
def processar_respostas():
    respostas = []
    respostas.append(variedade_var.get())
    respostas.append(risco_var.get())
    respostas.append(tempo_var.get())

    # Chamando a função sugerir investimentos
    perfil, sugestao = sugerir_investimentos(respostas)

    if sugestao:
        messagebox.showinfo("Sugestões de Investimentos",
                            f"Baseado nas suas respostas, você é um investidor '{perfil}' e considere os seguintes investimentos: {', '.join(sugestao)}.")
    else:
        messagebox.showwarning("Sem Sugestões",
                               f"Você é um investidor '{perfil}', mas não foi possível sugerir investimentos com base nas suas respostas.")


# Criando a interface gráfica
root = tk.Tk()
root.title("Consultor de Investimentos")

# Variáveis para capturar as respostas
variedade_var = tk.StringVar(value='baixo')
risco_var = tk.StringVar(value='baixo')
tempo_var = tk.StringVar(value='baixo')

# Campos para o usuário responder
tk.Label(root, text="Variedade de investimentos:").grid(row=0, column=0)
tk.OptionMenu(root, variedade_var, "baixo", "moderado", "alto").grid(row=0, column=1)

tk.Label(root, text="Risco:").grid(row=1, column=0)
tk.OptionMenu(root, risco_var, "baixo", "moderado", "alto").grid(row=1, column=1)

tk.Label(root, text="Tempo de investimento:").grid(row=2, column=0)
tk.OptionMenu(root, tempo_var, "baixo", "moderado", "alto").grid(row=2, column=1)

# Botão para processar as respostas
tk.Button(root, text="Sugerir Investimentos", command=processar_respostas).grid(row=3, column=0, columnspan=2)

# Iniciando o loop da interface gráfica
root.mainloop()
