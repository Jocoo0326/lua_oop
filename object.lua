local Object = {}
Object.is_a = {[Object] = true}

function Object.extend(...)
   local cls, bases = {}, {...}
   -- copy base class contents into the new class
   for i, base in ipairs(bases) do
      for k, v in pairs(base) do
	 cls[k] = v
      end
   end

   -- set the class's __index, and start filling an "is_a" table that contains this class and all of
   -- it's base classes, so you can do an "instanse of" check using my_instance.is_a[MyClass]
   cls.__index, cls.is_a = cls, {[cls] = true}
   for i, base in ipairs(bases) do
      for c in pairs(base.is_a) do
	 cls.is_a[c] = true
      end
      cls.is_a[base] = true
   end

   -- set the class's __call method
   setmetatable(cls, {
		   __call = function (c, ...)
		      local instance = setmetatable({}, c)
		      -- run the init method if it's there
		      if instance._init then
			 instance:_init(...)
		      end
		      return instance
		   end
   })
   return cls
end

function Object:_init()
end

function Object:__tostring()
   return "Object"
end

return Object
