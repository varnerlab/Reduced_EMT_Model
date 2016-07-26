# stores all datafile edit information that pertains to all simulations

### UPDATE FUNCTION FOR DATA FILE ARRAYS

function UpdateArray(data_dictionary,string,alterations=[])
  # access array
  data_array = data_dictionary[string]
  # set modifications for all conditions here
  for i=1:size(alterations)
    updates = alterations[i]
    index = updates[1]
    value = updates[2]
    data_array[index]=value;
  data_dictionary[string] = data_array
  return data_dictionary
end
