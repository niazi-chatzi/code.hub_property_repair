package com.codehub.pf.team4.mappers;

import com.codehub.pf.team4.domains.Repair;
import com.codehub.pf.team4.models.RepairModel;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Component
public abstract class RepairMapper {

    public static RepairModel mapToRepairModel(Repair repair) {
        if (repair == null) return null;

        RepairModel repairModel = new RepairModel();
        repairModel.setId(repair.getId());
        repairModel.setDate(repair.getDate());
        repairModel.setState(repair.getState());
        repairModel.setRepairType(repair.getRepairType());
        repairModel.setCost(repair.getCost());
        repairModel.setAddress(repair.getAddress());
        repairModel.setUserId(repair.getUser().getId());
        repairModel.setDescription(repair.getDescription());
        repairModel.setUser(repair.getUser().getFirstName() + ", " + repair.getUser().getLastName());
        return repairModel;
    }

    public static List<RepairModel> mapToRepairModelList(List<Repair> repairs){
        return repairs.stream()
                .map(RepairMapper::mapToRepairModel)
                .collect(Collectors.toList());
    }

    public static Optional<RepairModel> mapToRepairModelOptional(Repair repair) {
        if (repair == null) return Optional.empty();
        return Optional.of(mapToRepairModel(repair));
    }
}