using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Avancada.Models
{
    [MetadataType(typeof(ClienteMetadado))]
    public partial class Cliente { }
    public class ClienteMetadado
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
        public int Inteiro { get; set; }
    }
}