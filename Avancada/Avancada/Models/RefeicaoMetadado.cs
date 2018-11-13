using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Avancada.Models
{
    [MetadataType(typeof(RefeicaoMetadado))]
    public partial class Refeicao { }
    public class RefeicaoMetadado
    {
        [Required(ErrorMessage = "")]
        [StringLength(30, ErrorMessage = "")]
        public string Principal { get; set; }

        [Required(ErrorMessage = "")]
        [StringLength(30, ErrorMessage = "")]
        public string Salada { get; set; }

        [Required(ErrorMessage = "")]
        [StringLength(30, ErrorMessage = "")]
        public string Bebida { get; set; }

        [Required(ErrorMessage = "")]
        [StringLength(30, ErrorMessage = "")]
        public string Sobremesa { get; set; }

        [Required(ErrorMessage = "")]
        [StringLength(30, ErrorMessage = "")]
        public string Vegetariana { get; set; }

        [Required(ErrorMessage = "")]
        [StringLength(30, ErrorMessage = "")]
        public string UsuarioId { get; set; }

        [Required(ErrorMessage = "")]
        [StringLength(30, ErrorMessage = "")]
        public string Data { get; set; }


    }
}