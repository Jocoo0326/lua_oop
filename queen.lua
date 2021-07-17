N = 8
count = 0

function isPlaceOk(t, n, c)
   for i = 1, n-1 do
      if t[i] == c or
	 n - i == c - t[i] or
	 n - i == t[i] - c then
	 return false
      end
   end
   return true
end

function printQueen(t)
   count = count +1
   print(count .. "--------------------------------------")
   for i = 1, N do
      local l = ""
      for j = 1, N do
	 if t[i] == j then
	    l = l .. "X"
	 else
	    l = l .. "-"
	 end
      end
      print(l)
   end
end

function addQueen(t, n)
   if n > N then
      printQueen(t)
   else
      for c = 1, N do
	 if isPlaceOk(t, n, c) then
	    t[n] = c
	    addQueen(t, n+1)
	 end
      end
   end
end

addQueen({}, 1)
