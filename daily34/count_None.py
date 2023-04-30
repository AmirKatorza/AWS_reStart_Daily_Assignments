def count_None(lst: list) -> int:
    counter = 0
    for obj in lst:
        if obj is None:
            counter += 1
    return counter


if __name__ == "__main__":
    lst = [1, None, None, 5, None, 2]
    print(f"number of None values in the list is: {count_None(lst)}")
