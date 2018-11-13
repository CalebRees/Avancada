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
        public string Saldo { get; set; }

        [Required(ErrorMessage = "")]
        [StringLength(30, ErrorMessage = "")]
        public string Tipo { get; set; }

    }
}