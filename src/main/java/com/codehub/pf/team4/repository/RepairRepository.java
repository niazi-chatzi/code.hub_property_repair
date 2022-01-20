package com.codehub.pf.team4.repository;

import com.codehub.pf.team4.domains.Repair;
import com.codehub.pf.team4.enums.State;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface RepairRepository extends JpaRepository<Repair, Long> {
    List<Repair> findByDateAndState(LocalDate date, State state);
    List<Repair> findByDate(LocalDate searchDate);
    List<Repair> findByDateIsBetween(LocalDate fromDateLD, LocalDate toDateLD);
}
