# Checkpoint - Manipulation des structures de données en Python

# -------------------------------
# Question 1 : Multiplier tous les éléments d'une liste
print("=== Question 1 ===")
my_list = [2, 3, 6]
result = 1
for num in my_list:
    result *= num
print("Résultat =", result)  # Résultat attendu = 36

# -------------------------------
# Question 2 : Trier une liste de tuples par le dernier élément
print("\n=== Question 2 ===")
list_tuples = [(2, 5), (1, 2), (4, 4), (2, 3), (2, 1)]
list_tuples.sort(key=lambda x: x[-1])
print("Résultat attendu:", list_tuples)
# Résultat attendu : [(2, 1), (1, 2), (2, 3), (4, 4), (2, 5)]

# -------------------------------
# Question 3 : Combiner deux dictionnaires
print("\n=== Question 3 ===")
d1 = {'a': 100, 'b': 200, 'c': 300}
d2 = {'a': 300, 'b': 200, 'd': 400}
result_dict = d1.copy()
for key, value in d2.items():
    result_dict[key] = result_dict.get(key, 0) + value
print("Résultat attendu:", result_dict)
# Résultat attendu: {'a': 400, 'b': 400, 'c': 300, 'd': 400}

# -------------------------------
# Question 4 : Générer un dictionnaire {i : i*i}
print("\n=== Question 4 ===")
n = 8
squares = {i: i*i for i in range(1, n+1)}
print("Résultat:", squares)
# Résultat attendu: {1:1, 2:4, 3:9, 4:16, 5:25, 6:36, 7:49, 8:64}

# -------------------------------
# Question 5 : Trier une liste de tuples par valeur flottante
print("\n=== Question 5 ===")
list_data = [('item1', '12.20'), ('item2', '15.10'), ('item3', '24.5')]
sorted_list = sorted(list_data, key=lambda x: float(x[1]), reverse=True)
print("Résultat attendu:", sorted_list)
# Résultat attendu: [('item3', '24.5'), ('item2', '15.10'), ('item1', '12.20')]

# -------------------------------
# Question 6 : Manipulation des ensembles
print("\n=== Question 6 ===")
s = {0, 1, 2, 3, 4}
print("Ensemble initial:", s)

print("Itération sur l'ensemble:")
for item in s:
    print("Élément:", item)

s.add(5)
s.update([6, 7])
print("Après ajout:", s)

s.remove(3)   # supprime l'élément 3
s.discard(10) # ne fait rien si 10 n'existe pas
print("Après suppression:", s)
