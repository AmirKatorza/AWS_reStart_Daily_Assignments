def display_info(company_name: str, price=None):
    if price is not None:
        print(f"Company name: {company_name}\nPrice: {price}$")
    else:
        print(f"Company name: {company_name}")


if __name__ == "__main__":
    display_info("Apple", 114)
    print()
    display_info("Microsoft")