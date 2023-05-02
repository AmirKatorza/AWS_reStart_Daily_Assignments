import re

text = """Python is powerful... and fast
plays well with others
runs everywhere
is friendly & easy to learn
is Open
These are some of the reasons people who use Python would rather
not use anything else"""

result = re.sub(r'[^\w\s]', '', text)
result = re.sub(r'[\n]', ' ', result)
result = result.lower()
print(result)

words_arr = result.split()
new_arr = []
for word in words_arr:
    if len(word) > 6:
        new_arr.append(word)

print(new_arr)
