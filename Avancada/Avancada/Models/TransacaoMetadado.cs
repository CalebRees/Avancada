using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Avancada.Models
{
    [MetadataType(typeof(TransacaoMetadado))]
    public partial class Transacao { }
    public class TransacaoMetadado
    {

        [Required(ErrorMessage = "")]
        public decimal Valor { get; set; }

        [Required(ErrorMessage = "")]
        public int Forma { get; set; }

        [Required(ErrorMessage = "")]
        public int ClienteId { get; set; }

        [Required(ErrorMessage = "")]
        public int UsuarioId { get; set; }
        
        [Required(ErrorMessage = "")]
        [StringLength(30, ErrorMessage = "")]

        [Required(ErrorMessage = "")]
        [StringLength(30, ErrorMessage = "")]
        public string Email { get; set; }
        public string Email { get; set; }

    }
}