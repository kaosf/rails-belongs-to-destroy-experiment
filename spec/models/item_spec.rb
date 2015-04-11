require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "belongs_to destroy" do
    let!(:item_group) { ItemGroup.create }
    let!(:items) { item_group.items }
    let!(:item1) { items.create }
    let!(:item2) { items.create }

    it { expect(ItemGroup.count).to eq 1 }
    it { expect(Item.count).to eq 2 }
    it { expect(items.count).to eq 2 }

    it { expect { item_group.destroy }.to change { ItemGroup.count }.by -1 }
    it { expect { item_group.destroy }.to change { Item.count }.by -2 }

    it { expect { item1.destroy }.to change { Item.count }.by -1 }
    it { expect { item1.destroy }.not_to change { ItemGroup.count } }

    it { expect { items.destroy_all }.to change { Item.count }.by -2 }
    it { expect { items.destroy_all }.to change { Item.count }.to 0 }
    it { expect { items.destroy_all }.to change { ItemGroup.count }.by -1 }
  end
end
