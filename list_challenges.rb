def theed(list)
    count_3 = 0
    list.each do |x|
        if x == 3
            count_3 += 1
        end
    end
    if count_3 == 3
        return true
    else
        return false
    end
end

# puts theed([3, 3, 5, 4, 3])
# puts theed([3, 3, 3, 3])
# puts theed([1, 2, 3, 4, 3])

def same_first_last(list)
    if list.length > 1 && list[0] == list[(list.length-1)]
        return true
    else 
        return false
    end
end

# puts same_first_last([1, 2, 1])
# puts same_first_last([1])
# puts same_first_last([1, 2, 2, 2])

def get_sandwich(string)
bread_count = 0
    (string.length-4).times do |i|
        if string[i..i+4] == "bread" && bread_count == 0
            string = string[i+5..(string.length-1)]
            bread_count += 1
        end
        if string[(string.length-5-i)..(string.length-1-i)] == "bread" && bread_count == 1
            string = string[0..(string.length-6-i)]
            bread_count += 1
        end
     end
    if bread_count == 2 
        return string
    else 
        return ""
    end
end

# puts get_sandwich("breadjambread")
# puts get_sandwich("breadotherstuff")
# puts get_sandwich("breadbreadbread")

def shift_left(list)
    list.push(list[0])
    list.delete_at(0)
    return list
end

# print shift_left([1, 2, 3, 4])

def sum(list)
    sum = 0
    list.each do |x|
        sum += x
    end
    return sum
end

def can_balance(list)
    bool = false
    (list.length-1).times do |i|
        if sum(list[0..i]) == sum(list[i+1..list.length-1])
            bool = true
        end
    end
    return bool
end

# puts can_balance([1, 2, 3, 4, 2])
# puts can_balance([1, 2, 1, 2, 3, 4, 6])

def count_code(string)
    count = 0
    (string.length-3).times do |i|
        if string[i..i+1] == "co" && string[i+3] == "e"
            count += 1
        end
    end
    return count
end

# puts count_code("codecopecoke")
# puts count_code("codecodeccooddee")

def median(list)
    middle = list.length / 2
    if list.length % 2 == 0
        return (list[middle] + list[middle - 1]) / 2.0
    else 
        return list[middle]
    end
end

def middle_way(list1, list2)
    m = []
    m.push(median(list1))
    m.push(median(list2))
    return m 
end

# print middle_way([1, 2, 3], [2, 5, 3])
# print middle_way([1, 3, 6, 2], [5, 5, 5])

def either_2_4(list)
    has_2 = false
    has_4 = false
    (list.length-1).times do |i|
        if list[i] == 2 && list[i+1] == 2
            has_2 = true
        end
        if list[i] == 4 && list[i+1] == 4
            has_4 = true
        end
    end
    if (has_2 && !has_4) || (has_4 && !has_2)
        return true
    else
        return false
    end
end

# puts either_2_4([2, 5, 4])

def max_span(list)
    list_position = 0
    span = 0
    max_span = 1
    list.each do |x|
        list.length.times do |i|
            if x == list[-i-1]
                span = (list.length-i-1) - list_position
                if span > max_span
                    max_span = span
                end
            end
        end
        list_position += 1
    end
    return max_span
end 

# puts max_span([1])
# puts max_span([1, 2, 3, 4, 1])
# puts max_span([2, 2, 3, 5, 6, 2])

def g_happy(string)
    bool = true
    string.length.times do |i|
        if string[i] == "g" && !(string[i-1] == "g" || string[i+1] == "g")
            bool = false
        end
    end
    return bool
end

# puts g_happy("baggy")
# puts g_happy("glug")

def minimum(list)
    min = list[0]
    list.each do |x|
        if x < min
            min = x
        end
    end
    return min
end

def merge(list1, list2)
    merged = []
    combined = list1 + list2
    combined.length.times do
        min = minimum(combined)
        combined.count(min).times do 
            merged.push(min)
        end
        combined.delete(min)
    end
    return merged
end

# print merge([1, 2, 8], [4, 9, 10])
