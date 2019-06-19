package com.gsitm.mbms.equipment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class EquipmentDTO {
	private int eqNo;
	private String eqName;
	private int eqCount;
	private int roomNo;
}
