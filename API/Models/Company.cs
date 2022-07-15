using System;
using System.Collections.Generic;

namespace API.Models
{
    public partial class Company
    {
        public Company()
        {
            Products = new HashSet<Product>();
        }

        public int CompanyId { get; set; }
        public string Name { get; set; } = null!;
        public string Province { get; set; } = null!;
        public string City { get; set; } = null!;
        public string Address { get; set; } = null!;
        public string PhoneNumber { get; set; } = null!;
        public string LegalRepresentative { get; set; } = null!;

        public virtual ICollection<Product> Products { get; set; }
    }
}
