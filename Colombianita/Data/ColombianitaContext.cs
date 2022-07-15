using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using API.Models;

namespace API.Data
{
    public class ColombianitaContext : DbContext
    {
        public ColombianitaContext (DbContextOptions<ColombianitaContext> options)
            : base(options)
        {
        }

        public DbSet<API.Models.Company> Company { get; set; } = default!;
    }
}
