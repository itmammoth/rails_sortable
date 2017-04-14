10.times {|i| Item.create! title: "Title#{i}", sort: i }
10.times {|i| SequencedItem.create! title: "OtherTitle#{i}", sequence: i }
