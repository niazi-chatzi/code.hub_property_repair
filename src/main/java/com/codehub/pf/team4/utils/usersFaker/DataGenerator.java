package com.codehub.pf.team4.utils.usersFaker;

import com.codehub.pf.team4.domains.Property;
import com.codehub.pf.team4.domains.Repair;
import com.codehub.pf.team4.domains.User;
import com.codehub.pf.team4.repository.PropertyRepository;
import com.codehub.pf.team4.repository.RepairRepository;
import com.codehub.pf.team4.repository.UserRepository;
import com.codehub.pf.team4.utils.RandomnessProvider;
import com.github.javafaker.Faker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.time.LocalDate;

@Component
public class DataGenerator {

    Faker faker = new Faker();

    @Autowired
    PropertyRepository propertyRepository;

    @Autowired
    RepairRepository repairRepository;

    @Bean
    public CommandLineRunner run(UserRepository userRepository) throws Exception {
        return (String[] args) -> {
            for (long i = 0; i < 17; i++) {
                User user1 = new User();
                user1.setFirstName(faker.name().firstName());
                user1.setLastName(faker.name().lastName());
                user1.setAddress(faker.address().streetAddress());
                user1.setAfm(Long.valueOf(RandomnessProvider.getRandomNumber(9)).toString());
                user1.setEmail(faker.pokemon().name() + RandomnessProvider.getRandomNumber(2, 5) + "@gmail.com");
                user1.setPassword(String.valueOf(RandomnessProvider.getRandomNumber(9)));
                user1.setPhoneNumber(RandomnessProvider.getRandomNumber(10L));
                user1.setRoles(RandomnessProvider.getRoles());

                userRepository.save(user1);
                makePropertiesForUser(user1);
                makeRepairsForUser(user1);
            }
            userRepository.findAll().forEach(user -> System.out.println(user));
        };
    }

    private void makeRepairsForUser(User user1) {
        for (long i = 0; i < RandomnessProvider.getRandomNumberBetween(1, 2); i++) {
            Repair repair1 = new Repair();
            repair1.setUser(user1);
            repair1.setDate(LocalDate.of(2020, RandomnessProvider.getMonthGiver(), RandomnessProvider.getDayGiver()));
            repair1.setState(RandomnessProvider.getRandomState());
            repair1.setRepairType(RandomnessProvider.getRandomRepairType());
            repair1.setCost(RandomnessProvider.getCost());
            repair1.setAddress(user1.getAddress());
            repair1.setDescription(faker.lorem().sentence());

            repairRepository.save(repair1);
        }
    }

    private void makePropertiesForUser(User user1) {
        for (long i = 0; i < RandomnessProvider.getRandomNumberBetween(1, 2); i++) {
            Property property1 = new Property();
            property1.setUser(user1);
            property1.setPropertyId(Long.valueOf(RandomnessProvider.getRandomNumber(9)).toString());
            property1.setAddress(user1.getAddress());
            property1.setYearOfConstruction(String.valueOf(RandomnessProvider.getRandomNumberBetween(1952, 2020)));
            property1.setHouseType(RandomnessProvider.getRandomHouseType());

            propertyRepository.save(property1);
        }
    }

}
