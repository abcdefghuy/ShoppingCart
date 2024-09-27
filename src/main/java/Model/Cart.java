package Model;

import java.io.Serializable;
import java.util.ArrayList;

public class Cart implements Serializable {
    private final ArrayList<LineItem> items;

    public Cart() {
        items = new ArrayList<LineItem>();
    }
    public ArrayList<LineItem> getItems() {
        return items;
    }

    public int getCount(){
        return items.size();
    }

    public void addItem(LineItem item) {
        String code = item.getProduct().getId();
        int quantity = item.getQuantity();
        for (LineItem cartItem : items) {
            if (cartItem.getProduct().getId().equals(code)) {
                cartItem.setQuantity(quantity);
                return;
            }
        }
        items.add(item);
    }

    public void removeItem(LineItem item) {
        String code = item.getProduct().getId();
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getProduct().getId().equals(code)) {
                items.remove(i);
                return;
            }
        }
    }


}
