using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VetClinic.Models
{
    public class Pet
    {
        public int PetId { get; set; }
        public string PetName { get; set; }
        public int HumanOwnerId { get; set; }
        public int VetId { get; set; }
        public int AnimalTypeId { get; set; }
    }
}