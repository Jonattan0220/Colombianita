using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using API.Data;
using API.Models;
using Newtonsoft.Json;

namespace Colombianita.Controllers
{
    public class CompaniesController : Controller
    {
        // GET: Companies
        public async Task<IActionResult> Index()
        {
            List<Company> companies = new List<Company>();
            string apiUrl = "https://localhost:7172/api/Companies";

            HttpClient client = new HttpClient();
            HttpResponseMessage response = client.GetAsync(apiUrl).Result;
            if (response.IsSuccessStatusCode)
            {
                companies = JsonConvert.DeserializeObject<List<Company>>(response.Content.ReadAsStringAsync().Result);
            }
              return companies != null ? 
                          View(companies) :
                          Problem("Entity set 'Empresas'  is null.");
        }
    }
}
