package com.codehub.pf.team4.repository;

import com.codehub.pf.team4.domains.Property;
import com.codehub.pf.team4.domains.Repair;
import com.codehub.pf.team4.domains.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findById(Long id);
    Optional<User> findByAfm(String afm);
    Optional<User> findByEmail(String email);

    @Query(value ="SELECT r FROM Repair r JOIN FETCH r.user u WHERE u.afm = (:afm)")
    List<Repair> findRepairsByAfm(@Param("afm") String afm);

    @Query(value ="SELECT r FROM Repair r JOIN FETCH r.user u WHERE u.id = (:id)")
    List<Repair> findRepairsByUserId(@Param("id") Long id);

    @Query(value ="SELECT r FROM Repair r JOIN FETCH r.user u WHERE u.email = (:email)")
    List<Repair> findRepairsByUserEmail(@Param("email") String email);

    @Query(value ="SELECT p FROM Property p JOIN FETCH p.user u WHERE u.afm = (:afm)")
    List<Property> findPropertiesByAfm(@Param("afm") String afm);

}