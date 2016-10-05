using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VetClinic.Models;
using System.Data.Entity;

namespace VetClinic.DAL
{
    public class VetClinicContext: DbContext
    {
        public DbSet<Pet> PetTable { get; set; }
        public DbSet<Vet> VetTable { get; set; }
        public DbSet<Owner> OwnerTable { get; set; }
        public DbSet<AnimalType> AnimalTypeTable { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Pet>()
                .ToTable("Pet")
                .HasKey(c => c.PetId);

            modelBuilder.Entity<Owner>()
                .ToTable("Owner")
                .HasKey(c => c.OwnerId);

            modelBuilder.Entity<Vet>()
                .ToTable("Vet")
                .HasKey(c => c.VetId);

            modelBuilder.Entity<AnimalType>()
                .ToTable("AnimalType")
                .HasKey(c => c.AnimalTypeId);

        }
    }
}