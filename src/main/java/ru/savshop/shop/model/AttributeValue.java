package ru.savshop.shop.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "atribute_value")

public class AttributeValue {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    private int id;

    @ManyToOne(cascade = CascadeType.MERGE)
    private Attributes atributes;
    @Column
    private String value;
    @ManyToOne
    private Post post;
}