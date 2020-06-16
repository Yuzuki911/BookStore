using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace BookStore.Models
{   [Serializable]
    public class CartItem
    {
        public BOOK Book { get; set; }
        public int Quantity { set; get; }
    }
    public class CART
    {
        private List<CartItem> lineCollection = new List<CartItem>();

        public void AddItem(BOOK sp,int quantity)
        {
            CartItem line = lineCollection.Where(p => p.Book.ID == sp.ID).FirstOrDefault();
            if (line == null)
            {
                lineCollection.Add(new CartItem
                {
                    Book = sp,
                    Quantity = quantity
                });
            }
            else
            {
                line.Quantity += quantity;
                if (line.Quantity <= 0)
                {
                    lineCollection.RemoveAll(l => l.Book.ID == sp.ID);
                }
            }
        }
        public void UpdateItem(BOOK sp,int quantity)
        {
            CartItem line = lineCollection.Where(p => p.Book.ID == sp.ID).FirstOrDefault();
            if (line !=null )
            {
                if (quantity > 0)
                {
                    line.Quantity = quantity;
                }
                else
                {
                    lineCollection.RemoveAll(l => l.Book.ID == sp.ID);
                }
            }
        }

        public void RemoveLine(BOOK sp)
        {
            lineCollection.RemoveAll(l => l.Book.ID == sp.ID);
        }

        public int? ComputeTotalValue()
        {
            return lineCollection.Sum(e => e.Book.PRICE * e.Quantity);
        }
        public int? ComputeTotalProduct()
        {
            return lineCollection.Sum(e => e.Quantity);
        }

        public void Clear()
        {
            lineCollection.Clear();
        }
        public IEnumerable<CartItem> Lines
        {
            get { return lineCollection; }
        }
    }
}