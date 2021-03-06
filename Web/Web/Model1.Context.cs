﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class BDArandaEntities : DbContext
    {
        public BDArandaEntities()
            : base("name=BDArandaEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Rol> Rol { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }
        public virtual DbSet<UsuarioRol> UsuarioRol { get; set; }
        public virtual DbSet<Web> Web { get; set; }
    
        public virtual int CrearUsuario(string nombre, byte[] claveHash, string nombres, string apellido, string direccion, string telefono, string correo, Nullable<byte> edad, Nullable<bool> activo, ObjectParameter responseMessage)
        {
            var nombreParameter = nombre != null ?
                new ObjectParameter("Nombre", nombre) :
                new ObjectParameter("Nombre", typeof(string));
    
            var claveHashParameter = claveHash != null ?
                new ObjectParameter("ClaveHash", claveHash) :
                new ObjectParameter("ClaveHash", typeof(byte[]));
    
            var nombresParameter = nombres != null ?
                new ObjectParameter("Nombres", nombres) :
                new ObjectParameter("Nombres", typeof(string));
    
            var apellidoParameter = apellido != null ?
                new ObjectParameter("Apellido", apellido) :
                new ObjectParameter("Apellido", typeof(string));
    
            var direccionParameter = direccion != null ?
                new ObjectParameter("Direccion", direccion) :
                new ObjectParameter("Direccion", typeof(string));
    
            var telefonoParameter = telefono != null ?
                new ObjectParameter("Telefono", telefono) :
                new ObjectParameter("Telefono", typeof(string));
    
            var correoParameter = correo != null ?
                new ObjectParameter("Correo", correo) :
                new ObjectParameter("Correo", typeof(string));
    
            var edadParameter = edad.HasValue ?
                new ObjectParameter("Edad", edad) :
                new ObjectParameter("Edad", typeof(byte));
    
            var activoParameter = activo.HasValue ?
                new ObjectParameter("Activo", activo) :
                new ObjectParameter("Activo", typeof(bool));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("CrearUsuario", nombreParameter, claveHashParameter, nombresParameter, apellidoParameter, direccionParameter, telefonoParameter, correoParameter, edadParameter, activoParameter, responseMessage);
        }
    
        public virtual int CrearWeb(string web, Nullable<bool> activa)
        {
            var webParameter = web != null ?
                new ObjectParameter("Web", web) :
                new ObjectParameter("Web", typeof(string));
    
            var activaParameter = activa.HasValue ?
                new ObjectParameter("Activa", activa) :
                new ObjectParameter("Activa", typeof(bool));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("CrearWeb", webParameter, activaParameter);
        }
    
        public virtual int EliminarUsuario(string nombre, byte[] claveHash, ObjectParameter responseMessage)
        {
            var nombreParameter = nombre != null ?
                new ObjectParameter("Nombre", nombre) :
                new ObjectParameter("Nombre", typeof(string));
    
            var claveHashParameter = claveHash != null ?
                new ObjectParameter("ClaveHash", claveHash) :
                new ObjectParameter("ClaveHash", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("EliminarUsuario", nombreParameter, claveHashParameter, responseMessage);
        }
    
        public virtual int EliminarWeb(string web)
        {
            var webParameter = web != null ?
                new ObjectParameter("Web", web) :
                new ObjectParameter("Web", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("EliminarWeb", webParameter);
        }
    
        public virtual int ModificarUsuario(string nombre, byte[] claveHashAnt, byte[] claveHashNue, string nombres, string apellido, string direccion, string telefono, string correo, Nullable<byte> edad, Nullable<bool> activo, ObjectParameter responseMessage)
        {
            var nombreParameter = nombre != null ?
                new ObjectParameter("Nombre", nombre) :
                new ObjectParameter("Nombre", typeof(string));
    
            var claveHashAntParameter = claveHashAnt != null ?
                new ObjectParameter("ClaveHashAnt", claveHashAnt) :
                new ObjectParameter("ClaveHashAnt", typeof(byte[]));
    
            var claveHashNueParameter = claveHashNue != null ?
                new ObjectParameter("ClaveHashNue", claveHashNue) :
                new ObjectParameter("ClaveHashNue", typeof(byte[]));
    
            var nombresParameter = nombres != null ?
                new ObjectParameter("Nombres", nombres) :
                new ObjectParameter("Nombres", typeof(string));
    
            var apellidoParameter = apellido != null ?
                new ObjectParameter("Apellido", apellido) :
                new ObjectParameter("Apellido", typeof(string));
    
            var direccionParameter = direccion != null ?
                new ObjectParameter("Direccion", direccion) :
                new ObjectParameter("Direccion", typeof(string));
    
            var telefonoParameter = telefono != null ?
                new ObjectParameter("Telefono", telefono) :
                new ObjectParameter("Telefono", typeof(string));
    
            var correoParameter = correo != null ?
                new ObjectParameter("Correo", correo) :
                new ObjectParameter("Correo", typeof(string));
    
            var edadParameter = edad.HasValue ?
                new ObjectParameter("Edad", edad) :
                new ObjectParameter("Edad", typeof(byte));
    
            var activoParameter = activo.HasValue ?
                new ObjectParameter("Activo", activo) :
                new ObjectParameter("Activo", typeof(bool));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ModificarUsuario", nombreParameter, claveHashAntParameter, claveHashNueParameter, nombresParameter, apellidoParameter, direccionParameter, telefonoParameter, correoParameter, edadParameter, activoParameter, responseMessage);
        }
    
        public virtual int ModificarWeb(string webAnt, string web, Nullable<bool> activa)
        {
            var webAntParameter = webAnt != null ?
                new ObjectParameter("WebAnt", webAnt) :
                new ObjectParameter("WebAnt", typeof(string));
    
            var webParameter = web != null ?
                new ObjectParameter("Web", web) :
                new ObjectParameter("Web", typeof(string));
    
            var activaParameter = activa.HasValue ?
                new ObjectParameter("Activa", activa) :
                new ObjectParameter("Activa", typeof(bool));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ModificarWeb", webAntParameter, webParameter, activaParameter);
        }
    
        public virtual int ReversarEliminarUsuario(string nombre, byte[] claveHash, ObjectParameter responseMessage)
        {
            var nombreParameter = nombre != null ?
                new ObjectParameter("Nombre", nombre) :
                new ObjectParameter("Nombre", typeof(string));
    
            var claveHashParameter = claveHash != null ?
                new ObjectParameter("ClaveHash", claveHash) :
                new ObjectParameter("ClaveHash", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ReversarEliminarUsuario", nombreParameter, claveHashParameter, responseMessage);
        }
    
        public virtual int ReversarEliminarWeb(string web)
        {
            var webParameter = web != null ?
                new ObjectParameter("Web", web) :
                new ObjectParameter("Web", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ReversarEliminarWeb", webParameter);
        }
    
        public virtual ObjectResult<SeleccionWeb_Result> SeleccionWeb(Nullable<int> todos, Nullable<int> pKWeb)
        {
            var todosParameter = todos.HasValue ?
                new ObjectParameter("Todos", todos) :
                new ObjectParameter("Todos", typeof(int));
    
            var pKWebParameter = pKWeb.HasValue ?
                new ObjectParameter("PKWeb", pKWeb) :
                new ObjectParameter("PKWeb", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SeleccionWeb_Result>("SeleccionWeb", todosParameter, pKWebParameter);
        }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual int sp_upgraddiagrams()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
        }
    
        public virtual ObjectResult<UserRol_Result> UserRol(Nullable<int> seleccion, Nullable<int> pKRol, string nombreRol, string nombreRolNue, Nullable<bool> activo, ObjectParameter salida)
        {
            var seleccionParameter = seleccion.HasValue ?
                new ObjectParameter("Seleccion", seleccion) :
                new ObjectParameter("Seleccion", typeof(int));
    
            var pKRolParameter = pKRol.HasValue ?
                new ObjectParameter("PKRol", pKRol) :
                new ObjectParameter("PKRol", typeof(int));
    
            var nombreRolParameter = nombreRol != null ?
                new ObjectParameter("NombreRol", nombreRol) :
                new ObjectParameter("NombreRol", typeof(string));
    
            var nombreRolNueParameter = nombreRolNue != null ?
                new ObjectParameter("NombreRolNue", nombreRolNue) :
                new ObjectParameter("NombreRolNue", typeof(string));
    
            var activoParameter = activo.HasValue ?
                new ObjectParameter("Activo", activo) :
                new ObjectParameter("Activo", typeof(bool));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UserRol_Result>("UserRol", seleccionParameter, pKRolParameter, nombreRolParameter, nombreRolNueParameter, activoParameter, salida);
        }
    
        public virtual int UsuarioLogin(string nombre, byte[] clave, string responseMessage)
        {
            var nombreParameter = nombre != null ?
                new ObjectParameter("Nombre", nombre) :
                new ObjectParameter("Nombre", typeof(string));
    
            var claveParameter = clave != null ?
                new ObjectParameter("Clave", clave) :
                new ObjectParameter("Clave", typeof(byte[]));

            var RespondeParameter = responseMessage != null ?
                new ObjectParameter("responseMessage", responseMessage) :
                new ObjectParameter("responseMessage", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("UsuarioLogin", nombreParameter, claveParameter, RespondeParameter);
        }
    }
}
