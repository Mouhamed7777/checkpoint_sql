
import random

print("Bienvenue dans le jeu Devinez le nombre!")

nombre_secret = random.randint(1, 100)
tentatives = 0

while True:
    reponse = input("Je pense à un nombre entre 1 et 100. Pouvez-vous le deviner ?\nEntrez votre réponse : ")
    tentatives += 1

    try:
        reponse = int(reponse)
    except ValueError:
        print("Veuillez entrer un nombre valide.")
        continue

    if reponse < nombre_secret:
        print("Votre réponse est trop basse. Réessayez.")
    elif reponse > nombre_secret:
        print("Votre réponse est trop élevée. Réessayez.")
    else:
        print(f"Félicitations ! Vous avez deviné le nombre correctement en {tentatives} essais !")
        break
