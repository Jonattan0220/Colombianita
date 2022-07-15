using API.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Newtonsoft.Json;
using System.Text;

namespace Colombianita.Controllers
{
    public class ProductsController : Controller
    {
        // GET: ProductsController
        public async Task<IActionResult> Index()
        {
            List<Product> products = new List<Product>();
            string apiUrl = "https://localhost:7172/api/Products";

            HttpClient client = new HttpClient();
            HttpResponseMessage response = client.GetAsync(apiUrl).Result;
            if (response.IsSuccessStatusCode)
            {
                products = JsonConvert.DeserializeObject<List<Product>>(response.Content.ReadAsStringAsync().Result);
            }
            return products != null ?
                        View(products) :
                        Problem("Entity set 'Productos'  is null.");
        }

        // GET: ProductsController/Create
        public ActionResult Create()
        {
            List<Company> companies = new List<Company>();
            string apiUrl = "https://localhost:7172/api/Companies";

            HttpClient client = new HttpClient();
            HttpResponseMessage response = client.GetAsync(apiUrl).Result;
            if (response.IsSuccessStatusCode)
            {
                companies = JsonConvert.DeserializeObject<List<Company>>(response.Content.ReadAsStringAsync().Result);
            }

            ViewData["CompanyId"] = new SelectList(companies, "CompanyId", "CompanyId");
            return View();
        }

        // POST: ProductsController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult>  Create(Product product)
        {
            using(var client = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(product), Encoding.UTF8, "application/json");

                await client.PostAsync("https://localhost:7172/api/Products", content);
            }

            return RedirectToAction(nameof(Index));
        }

    }
}
