package com.codehub.pf.team4.service;

import com.codehub.pf.team4.domains.Repair;
import com.codehub.pf.team4.enums.State;
import com.codehub.pf.team4.forms.RepairForm;
import com.codehub.pf.team4.mappers.RepairFormMapper;
import com.codehub.pf.team4.mappers.RepairMapper;
import com.codehub.pf.team4.models.RepairModel;
import com.codehub.pf.team4.repository.RepairRepository;
import com.codehub.pf.team4.repository.UserRepository;
import com.codehub.pf.team4.utils.DateProvider;
import com.codehub.pf.team4.utils.GlobalAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;


@Service
public class RepairServiceImpl implements RepairService {

    @Autowired
    private RepairRepository repairRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public List<RepairModel> getAllRepairs() {
        return RepairMapper.mapToRepairModelList(repairRepository.findAll());
    }

    @Override
    public Page<RepairModel> getAllAsPage(int page) {
        Page<Repair> repairsPaged = repairRepository.findAll(PageRequest.of(page, GlobalAttributes.PAGE_CONTENT_SIZE));

        if (repairsPaged.isEmpty())  return Page.empty(); // if given page returns empty return empty

        List<RepairModel> userModel = RepairMapper.mapToRepairModelList(repairsPaged.getContent());
        return  new PageImpl(userModel, repairsPaged.getPageable(), repairsPaged.getTotalElements());
    }

    @Override
    public Optional<RepairModel> getRepairById(Long id) {
        return RepairMapper.mapToRepairModelOptional(repairRepository.findById(id).orElse(null));
    }

    public Optional<RepairForm> findRepairByIdAsRepairForm(Long id){
        try {
            RepairForm repairForm = RepairFormMapper.mapToRepairForm(repairRepository.findById(id).orElse(null));
            return Optional.ofNullable(repairForm);
        } catch (Exception e) {
            return Optional.empty();
        }
    }

    @Override // get the repairs that's populated for today
    public List<RepairModel> getOngoingRepairsOfTheDay() throws Exception {
        return RepairMapper.mapToRepairModelList(repairRepository.findByDateAndState(DateProvider.getToday(), State.ONGOING));
    }

    @Override // get them by a single date
    public List<RepairModel> getRepairsByDate(String date) {
        LocalDate localDate = DateProvider.getLocalDate(date);
        return RepairMapper.mapToRepairModelList(repairRepository.findByDate(localDate));
    }

    @Override // get the in a given date range
    public List<RepairModel> getRepairsByDate(String fromDate, String toDate) {
        LocalDate fromDateLD = DateProvider.getLocalDate(fromDate);
        LocalDate toDateLD = DateProvider.getLocalDate(toDate);
        return RepairMapper.mapToRepairModelList(repairRepository.findByDateIsBetween(fromDateLD, toDateLD));
    }

    @Override
    public Optional<RepairForm> getRepairByIdAsForm(Long id) {
        Repair theRepair = repairRepository.findById(id).orElse(null);

        if (theRepair == null) return Optional.empty();
        return Optional.of(RepairFormMapper.mapToRepairForm(theRepair));
    }

    @Override
    public Optional<RepairModel> addRepair(RepairForm newRepair) {
        Repair repair = RepairFormMapper.mapToRepair(newRepair);
        repair.setUser(userRepository.findById(repair.getUser().getId()).get());
        return RepairMapper.mapToRepairModelOptional(repairRepository.save(repair));
    }

    @Override
    public Optional<RepairModel> updateRepair(RepairForm toBeUpdatedRepair) {
        Repair toBeUpdateRepair = RepairFormMapper.mapToRepair(toBeUpdatedRepair);
        Repair originalRepair = repairRepository.findById(toBeUpdateRepair.getId()).get();
        if (toBeUpdateRepair.equals(originalRepair)) {
            // if no changes made dont update
            return RepairMapper.mapToRepairModelOptional(toBeUpdateRepair);
        }

        toBeUpdateRepair.setUser(originalRepair.getUser());
        return RepairMapper.mapToRepairModelOptional(repairRepository.save(toBeUpdateRepair));
    }

    @Override
    public boolean deleteRepairById(Long repairId) {
        if (repairId == null || getRepairById(repairId).isEmpty()) {
            return false;
        }

        repairRepository.deleteById(repairId);
        return true;
    }
}
