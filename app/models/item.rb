class Item < ActiveRecord::Base
  belongs_to :item_group

  after_destroy do
    group = ItemGroup.find(item_group.id)
    group.destroy if group.items.count == 0
  end
end
