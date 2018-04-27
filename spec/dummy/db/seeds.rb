Item.delete_all
10.times {|i| Item.create! title: "Title#{i}", sort: i }

SequencedItem.delete_all
10.times {|i| SequencedItem.create! title: "OtherTitle#{i}", sequence: i }

FirstItem.delete_all
(0..4).each {|i| FirstItem.create! title: "FirstTitle#{i}", sort: i }
SecondItem.delete_all
(5..9).each {|i| SecondItem.create! title: "SecondTitle#{i}", sort: i }