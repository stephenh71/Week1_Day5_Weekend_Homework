def pet_shop_name(pet_shop)
  pet_shop[:name]
end

def total_cash(pet_shop)
  pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,cash)
  pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop,pets_sold)
  pet_shop[:admin][:pets_sold] += pets_sold
end

def stock_count(pet_shop)
  pet_shop[:pets].count
end

def pets_by_breed(pet_shop,pet_breed)
pets = []
  for pet in pet_shop[:pets]
    pets.push(pet[:breed])
  end
pets.select{|x| x == pet_breed}
end

def find_pet_by_name(pet_shop,pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop,pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop,new_pet)
  pet_shop[:pets] << pet_shop[:new_pet]
end

def customer_cash(customer)
  customer[:cash]
end

def remove_customer_cash(customer,cash)
  customer[:cash] -= cash
end

def customer_pet_count(customer)
  customer[:pets].count
end

def add_pet_to_customer(customer,pet)
  customer[:pets] << pet
  customer[:pets].count
end

def customer_can_afford_pet(customer,pet)
  customer[:cash] >= pet[:price]
end

def sell_pet_to_customer(pet_shop,pet,customer)
  if pet != nil && customer_can_afford_pet(customer,pet)
      add_pet_to_customer(customer,pet)
      increase_pets_sold(pet_shop,1)
      remove_customer_cash(customer, pet[:price])
      add_or_remove_cash(pet_shop,pet[:price])
  end
end
