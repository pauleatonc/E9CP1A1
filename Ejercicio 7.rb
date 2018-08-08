#Utilizando el mismo archivo del ejercicio anterior:
#La tienda desea generar un nuevo catálogo que no incluya el último precio correspondiente a cada producto debido a que ya no comercializa productos de talla XS.
#Se pide generar un método que reciba como argumento los datos del archivo catalogo.txt y luego imprima el nuevo catálogo solicitado en un archivo llamado nuevo_catalogo.txt

class Product
  def initialize(name, *sizes)
    @name = name
    @large = sizes[0].to_i
    @medium = sizes[1].to_i
    @small = sizes[2].to_i
    @xsmall = sizes[3].to_i

    print "#{@name} - #{@large} - #{@medium} - #{@small} - #{@xsmall}\n"
  end

  def average
    # @prices_sizes.sum / @price_sizes.length
    (@large + @medium + @small + @xsmall) / 4
  end

  def delete_xs
  [@large, @medium, @small]
  end

  def to_s
    "#{@name}, #{@large}, #{@medium}, #{@small}\n"
  end
end

products_list = []
data = []
File.open('catalogo.txt', 'r') { |file| data = file.readlines}
data.each do |prod|
  ls = prod.split(', ')
  products_list << Product.new(*ls)
end

print "#{products_list}\n"
print "Promedio de precio: #{products_list[0].average}\n"
print "Lista de precios sin XS: #{products_list[0].delete_xs}\n"

f = File.open('nuevo_catalogo.txt', 'w+')
products_list.each do |product|
  f.print product
end
f.close
