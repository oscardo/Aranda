//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Web
{
    using System;
    using System.Collections.Generic;
    
    public partial class UsuarioRol
    {
        public int PKUsuarioRol { get; set; }
        public int FKUsuario { get; set; }
        public int FKRol { get; set; }
        public Nullable<int> FKWeb { get; set; }
        public Nullable<bool> Activo { get; set; }
    
        public virtual Rol Rol { get; set; }
        public virtual Usuario Usuario { get; set; }
        public virtual Web Web { get; set; }
    }
}
