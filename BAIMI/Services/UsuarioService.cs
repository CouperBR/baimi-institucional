using BAIMI.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAIMI.Services
{
    public class UsuarioService
    {
        public bool Login(usuario usuario)
        {
            using (var ctx = new BaimiContext())
            {
                var userGot = ctx.usuario.Where(x => x.email == usuario.email || x.nome == usuario.nome).FirstOrDefault();
                if (userGot == null)
                    return false;

                if (!BCrypt.Net.BCrypt.Verify(usuario.senha, userGot.senha))
                    return false;
            }

            return true;
        }
    }
}