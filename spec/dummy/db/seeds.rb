10.times {|i| Item.create! title: "Title#{i}", sort: i }
10.times {|i| OtherItem.create! title: "OtherTitle#{i}", sequence: i }
