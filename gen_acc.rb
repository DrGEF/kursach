def acc amount = 20
	fname = %w[Анна Вячеслав Василий Андрей Владислав Николай Зульфия Владимир Сергей Ольга Екатерина]
	lname = %w[Шнитко Мутко Ляшко Василенко Зеленко Потапченко Глушко Травко Небко Жидко Чфырчко]
	names = []
	amount.downto(0) do |a| 
		names << fname[rand(fname.length)] + ' ' + lname[rand(lname.length)]
	end

	names.uniq!
	f = File.open('acc.txt', 'w')
		names.each do |n|
			f.puts n
		end
	f.close
end

acc