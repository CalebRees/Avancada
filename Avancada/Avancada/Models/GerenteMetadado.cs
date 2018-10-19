using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Avancada.Models
{
    [MetadataType(typeof(GerenteMetadado))]
    public partial class Gerente { }
    public class GerenteMetadado
    {

        [Required(ErrorMessage = "")]
        [StringLength(30, ErrorMessage = "")]
        public string Nome { get; set; }

        [Required(ErrorMessage = "")]
        [StringLength(30, ErrorMessage = "")]
        public string Email { get; set; }

        [Required(ErrorMessage = "")]
        [StringLength(30, ErrorMessage = "")]
        public string Senha { get; set; }

        [Required(ErrorMessage = "")]
        [StringLength(30, ErrorMessage = "")]
        public string CPF { get; set; }

        [Required(ErrorMessage = "")]
        public decimal Salario { get; set; }
    }
}