using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;

namespace API.Models
{
    public partial class Product
    {
        public int ProductId { get; set; }
        public string Name { get; set; } = null!;
        public int CompanyId { get; set; }

        [ValidateNever]
        public virtual Company Company { get; set; } = null!;
    }
}
