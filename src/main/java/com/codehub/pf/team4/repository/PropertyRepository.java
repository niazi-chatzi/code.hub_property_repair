package com.codehub.pf.team4.repository;

import com.codehub.pf.team4.domains.Property;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PropertyRepository extends JpaRepository<Property, Long> {
    Optional<Property> findByPropertyId(String propertyID);
}
