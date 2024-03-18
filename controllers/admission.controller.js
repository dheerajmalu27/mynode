const { Admission } = require("../models");
const { FeesPaidByStudent } = require("../models");
const db = require("../models/index").db;
const { to, ReE, ReS } = require("../services/util.service");
const {
  getAllListOfDivisionByClassId,
} = require("../controllers/class.controller");
const _ = require("lodash");
const { where } = require("sequelize");
const create = async function (req, res) {
  let err, admissionObj, feesPaidObj;

  let admissionfeesPaidInfo = req.body;

  // Create key-value pair object
  let admissionInfo = {
    studentId: admissionfeesPaidInfo.studentId,
    firstName: admissionfeesPaidInfo.firstName,
    middleName: admissionfeesPaidInfo.middleName,
    lastName: admissionfeesPaidInfo.lastName,
    profileImage: admissionfeesPaidInfo.profileImage,
    gender: admissionfeesPaidInfo.gender,
    dateOfBirth: admissionfeesPaidInfo.dateOfBirth,
    classId: admissionfeesPaidInfo.classId,
    divId: admissionfeesPaidInfo.divId,
    motherName: admissionfeesPaidInfo.motherName,
    motherQual: admissionfeesPaidInfo.motherQual,
    motherProf: admissionfeesPaidInfo.motherProf,
    fatherName: admissionfeesPaidInfo.fatherName,
    fatherQual: admissionfeesPaidInfo.fatherQual,
    fatherProf: admissionfeesPaidInfo.fatherProf,
    parentNumber: admissionfeesPaidInfo.parentNumber,
    parentNumberSecond: admissionfeesPaidInfo.parentNumberSecond,
    nationality: admissionfeesPaidInfo.nationality,
    religion: admissionfeesPaidInfo.religion,
    caste: admissionfeesPaidInfo.caste,
    bloodGroup: admissionfeesPaidInfo.bloodGroup,
    address: admissionfeesPaidInfo.address,
    cityId: admissionfeesPaidInfo.cityId,
    stateId: admissionfeesPaidInfo.stateId,
    // pincode: admissionfeesPaidInfo.pincode,
  };

  let feesPaymentDetailsObj = {
    tuitionFee: admissionfeesPaidInfo.tuitionFee,
    developmentFee: admissionfeesPaidInfo.developmentFee,
    examinationFee: admissionfeesPaidInfo.examinationFee,
    sportsFee: admissionfeesPaidInfo.sportsFee,
    transportationFee: admissionfeesPaidInfo.transportationFee,
    libraryFee: admissionfeesPaidInfo.libraryFee,
    labFee: admissionfeesPaidInfo.labFee,
    securityFee: admissionfeesPaidInfo.securityFee,
    otherFee: admissionfeesPaidInfo.otherFee,
    totalFee: admissionfeesPaidInfo.totalFee,
    paymentFrequency: admissionfeesPaidInfo.totalFee,
    dueDate: admissionfeesPaidInfo.totalFee,
    lateFee: admissionfeesPaidInfo.lateFee,
    discount: admissionfeesPaidInfo.discount,
  };

  let feesPaidInfo = {
    admissionId: null,
    classId: admissionfeesPaidInfo.classId,
    divId: admissionfeesPaidInfo.divId,
    paymentAmount: admissionfeesPaidInfo.totalFee,
    remainingAmount: admissionfeesPaidInfo.remainingAmount,
    paymentMethod: admissionfeesPaidInfo.paymentMethod,
    paymentDetail: admissionfeesPaidInfo.paymentDetail,
    feesPaymentDetails: JSON.stringify(feesPaymentDetailsObj),
  };

  delete admissionInfo.id;

  console.log(req.file);
  if (req.file) {
    admissionInfo.profileImage = req.file.filename;
  }
  delete admissionInfo.image;

  console.log(admissionInfo);

  // Create Admission record
  [err, admissionObj] = await to(Admission.create(admissionInfo));
  if (err) {
    console.log(err);
    return ReE(res, err, 422);
  }
  console.log(admissionObj);
  // Create feespaidbystudent record
  feesPaidInfo.admissionId = admissionObj.id;
  [err, feesPaidObj] = await to(FeesPaidByStudent.create(feesPaidInfo));
  if (err) return ReE(res, err, 422);
  console.log(feesPaidObj.paymentId);
  console.log(admissionObj.id);
  // Update paymentId in the Admission table
  [err, admissionObj] = await to(
    Admission.update(
      { paymentId: feesPaidObj.paymentId },
      { where: { id: admissionObj.id } }
    )
  );

  if (err) {
    // Handle the error, log it, and return a response if needed
    console.log(err);
    return ReE(res, err, 422);
  }

  let admissionJson = admissionObj; // Use toJSON to convert Sequelize instance to plain JSON

  return ReS(res, { admission: admissionJson, feesPaid: feesPaidObj }, 201);
};

module.exports.create = create;

const get = async function (req, res) {
  db.sequelize
    .query(
      "SELECT ad.*,cl.className,d.divName,f.paymentAmount,f.remainingAmount,f.paymentDate,f.paymentDetail,f.paymentMethod,f.feesPaymentDetails,f.paymentId AS paymentreciptid FROM admission AS ad LEFT JOIN class AS cl ON cl.id=ad.classId LEFT JOIN division AS d ON d.id=ad.divId  LEFT JOIN feespaidbystudent AS f ON f.paymentId=ad.paymentId where ad.id=" +
        req.params.admissionId,
      { type: db.sequelize.QueryTypes.SELECT }
    )
    .then(function (admission) {
      return ReS(res, { admission: admission });
    })
    .catch(function (err) {
      return ReE(res, err, 422);
    });

  // [err, admissionObj] = await to(Admission.findByPk(admissionId));
  // if(err) return ReE(res, err, 422);

  // let admissionJson = admissionObj.toWeb();

  // return ReS(res, {admission:admissionJson}, 201);
};
module.exports.get = get;

const update = async function (req, res) {
  let err, admissionObj, data, feesPaidObj;
  admissionObj = req.admission;
  data = req.body;

  // Create key-value pair object for admissionInfo
  let admissionInfo = {
    // studentId: data.studentId,
    firstName: data.firstName,
    middleName: data.middleName,
    lastName: data.lastName,
    // profileImage: data.profileImage,
    gender: data.gender,
    dateOfBirth: data.dateOfBirth,
    classId: data.classId,
    divId: data.divId,
    motherName: data.motherName,
    motherQual: data.motherQual,
    motherProf: data.motherProf,
    fatherName: data.fatherName,
    fatherQual: data.fatherQual,
    fatherProf: data.fatherProf,
    parentNumber: data.parentNumber,
    parentNumberSecond: data.parentNumberSecond,
    nationality: data.nationality,
    religion: data.religion,
    caste: data.caste,
    bloodGroup: data.bloodGroup,
    address: data.address,
    cityId: data.cityId,
    stateId: data.stateId,
  };

  // Create key-value pair object for feesPaymentDetails
  let feesPaymentDetailsObj = {
    tuitionFee: data.tuitionFee,
    developmentFee: data.developmentFee,
    examinationFee: data.examinationFee,
    sportsFee: data.sportsFee,
    transportationFee: data.transportationFee,
    libraryFee: data.libraryFee,
    labFee: data.labFee,
    securityFee: data.securityFee,
    otherFee: data.otherFee,
    totalFee: data.totalFee,
    paymentFrequency: data.paymentFrequency,
    dueDate: data.dueDate,
    lateFee: data.lateFee,
    discount: data.discount,
  };

  // Create key-value pair object for feesPaidInfo
  let feesPaidInfo = {
    admissionId: null,
    classId: data.classId,
    divId: data.divId,
    paymentAmount: data.totalFee,
    remainingAmount: data.remainingAmount,
    paymentMethod: data.paymentMethod,
    paymentDetail: data.paymentDetail,
    feesPaymentDetails: JSON.stringify(feesPaymentDetailsObj),
  };

  if (req.file) {
    // If an image was successfully uploaded, save the image name to the 'profileImage' column
    admissionInfo.profileImage = req.file.filename;
  }

  admissionObj.set(admissionInfo);

  [err, admissionObj] = await to(admissionObj.save());
  if (err) {
    // Handle the error, log it, and return a response if needed
    console.log(err);
    return ReE(res, err, 422);
  }
  console.log(admissionObj);
  // Retrieve feesPaidObj based on admissionId
  [err, feesPaidObj] = await to(
    FeesPaidByStudent.findOne({ where: { admissionId: admissionObj.id } })
  );
  if (err) {
    // Handle the error, log it, and return a response if needed
    console.log(err);
    return ReE(res, err, 422);
  }

  console.log(feesPaidObj);
  // if (feesPaidObj) {
  //     // Update paymentId in the Admission table
  //     [err, admissionObj] = await to(
  //         Admission.update(
  //             { paymentId: feesPaidObj.paymentId },
  //             { where: { id: admissionObj.id } }
  //         )
  //     );

  //     if (err) {
  //         // Handle the error, log it, and return a response if needed
  //         console.log(err);
  //         return ReE(res, err, 422);
  //     }
  // }

  return ReS(res, { message: "Updated Admission: " + admissionObj.id });
};

module.exports.update = update;

const remove = async function (req, res) {
  let admissionObj, err;
  admissionObj = req.admission;

  if (
    admissionObj.dataValues.paymentId != null &&
    admissionObj.dataValues.paymentId != ""
  ) {
    await db.sequelize.query(
      `
        DELETE FROM feespaidbystudent
        WHERE paymentId = :paymentId
    `,
      {
        replacements: {
          paymentId: admissionObj.dataValues.paymentId,
        },
        type: db.sequelize.QueryTypes.DELETE,
      }
    );
  }
  if (
    admissionObj.dataValues.studentId != null &&
    admissionObj.dataValues.studentId != ""
  ) {
    const isStudentIdPresent = await db.sequelize.query(
      `
          SELECT 1
          FROM testmarks
          WHERE studentId = :studentId
      `,
      {
        replacements: {
          studentId: admissionObj.dataValues.studentId,
        },
        type: db.sequelize.QueryTypes.SELECT,
      }
    );
    const isStudentIdPresentInAttendance = await db.sequelize.query(
      `
    SELECT 1
    FROM attendance
    WHERE studentId = :studentId
`,
      {
        replacements: {
          studentId: admissionObj.dataValues.studentId,
        },
        type: db.sequelize.QueryTypes.SELECT,
      }
    );

    if (
      isStudentIdPresent.length > 0 ||
      isStudentIdPresentInAttendance.length > 0
    ) {
      console.log(
        "Cannot delete student because it is associated with testmarks."
      );
    } else {
      // Delete the student record only if it is not associated with testmarks
      await db.sequelize.query(
        `
              DELETE FROM student
              WHERE id = :studentId
          `,
        {
          replacements: {
            studentId: admissionObj.dataValues.studentId,
          },
          type: db.sequelize.QueryTypes.DELETE,
        }
      );

      console.log("Student deleted successfully.");
    }
  }

  [err, admissionObj] = await to(admissionObj.destroy());

  if (err) return ReE(res, "error occured trying to delete admission");

  return ReS(res, { message: "Deleted Admission" }, 200);
};
module.exports.remove = remove;

const getAll = async function (req, res) {
  try {
    let active = req.query.active;
    let query =
      "SELECT ad.*, cl.className, d.divName, f.paymentAmount, f.remainingAmount, f.paymentDate, f.paymentDetail, f.paymentMethod, f.feesPaymentDetails, f.paymentId AS paymentreciptid " +
      "FROM admission AS ad " +
      "LEFT JOIN class AS cl ON cl.id=ad.classId " +
      "LEFT JOIN division AS d ON d.id=ad.divId  " +
      "LEFT JOIN feespaidbystudent AS f ON f.paymentId=ad.paymentId";

    if (
      typeof req.query !== "undefined" &&
      typeof req.query.active !== "undefined" &&
      req.query.active == 1
    ) {
      // query += " WHERE ad.active=1 and YEAR(ad.createdAt) = YEAR(CURDATE())";
      query += " WHERE YEAR(ad.createdAt) = YEAR(CURDATE())";
    }

    const admission = await db.sequelize.query(query, {
      type: db.sequelize.QueryTypes.SELECT,
    });

    return ReS(res, { admission: admission });
  } catch (error) {
    return ReE(res, { error: error });
  }
};

module.exports.getAll = getAll;

const getAllList = async function (req, res) {
  try {
    const admissions = await db.sequelize.query(
      'SELECT ad.id, CONCAT(ad.firstName, " ", ad.lastName, "-", cl.className, "-", d.divName) AS text ' +
        "FROM admission AS ad " +
        "LEFT JOIN class AS cl ON cl.id=ad.classId " +
        "LEFT JOIN division AS d ON d.id=ad.divId " +
        "WHERE ad.active = 1",
      { type: db.sequelize.QueryTypes.SELECT }
    );
    return ReS(res, { admission: admissions });
  } catch (error) {
    return ReE(res, { admission: error });
  }
};

module.exports.getAllList = getAllList;

const getAdmissionInfoAll = async function (req, res) {
  try {
    let admissionId = req.params.admissionId;
    const admission = await db.sequelize.query(
      "SELECT ad.*, cl.className, d.divName " +
        "FROM admission AS ad " +
        "LEFT JOIN class AS cl ON cl.id=ad.classId " +
        "LEFT JOIN division AS d ON d.id=ad.divId " +
        "WHERE ad.id=" +
        admissionId,
      { type: db.sequelize.QueryTypes.SELECT }
    );
    return ReE(res, { admission: admission });
  } catch (error) {
    return ReE(res, { admission: error });
  }
};

module.exports.getAdmissionInfoAll = getAdmissionInfoAll;

async function allocateStudents(students) {
  // Group students by classId
  try {
    let ReturnList = [];
    const groupedStudents = _.groupBy(students, "classId");
    const allocatedStudents = {};

    // Allocate students to divisions within each class
    for (const classId of Object.keys(groupedStudents)) {
      try {
        const divisionData = await db.sequelize.query(
          "SELECT d.id, d.divName as text FROM division d JOIN class c ON FIND_IN_SET(d.id, c.divIds) > 0 WHERE c.id =" +
            classId,
          { type: db.sequelize.QueryTypes.SELECT }
        );
        const ids = divisionData.map((item) => item.id);

        // Sort students by prevPercentage in descending order and then by gender
        const currentStudents = _.orderBy(
          groupedStudents[classId],
          ["prevPercentage", "gender", "firstName"],
          ["desc", "asc", "asc"]
        );

        // Initialize counters for each division
        const divisionCounters = {};
        ids.forEach((divId) => {
          allocatedStudents[`${classId}_${divId}`] = [];
          divisionCounters[divId] = 0; // Start the counter from 0
        });
        let divisionIndex = 0;
        // Allocate students to divisions and set roll numbers
        for (let i = 0; i < currentStudents.length; i++) {
          const student = currentStudents[i];
          // console.log(student);
          // Allocate to each divId one by one
          const divId = ids[divisionIndex];
          const rollNo = allocatedStudents[`${classId}_${divId}`].length + 1;
          const allocatedStudent = { ...student, divId, rollNo };
          allocatedStudents[`${classId}_${divId}`].push(allocatedStudent);

          // Move to the next division for the next student
          divisionIndex = (divisionIndex + 1) % ids.length;
        }
      } catch (error) {
        console.error("Error:", error);
      }
    }

    // Display allocation details
    Object.keys(allocatedStudents).forEach((key) => {
      const [classId, divId] = key.split("_");
      console.log(`Class ${classId} - divId ${divId}:`);
      allocatedStudents[key].forEach((student) => {
        ReturnList.push(student);
        console.log(
          `${student.firstName} - prevPercentage: ${student.prevPercentage}% - rollNo: ${student.rollNo} - Gender: ${student.gender} - classId: ${student.classId} - divId: ${student.divId}`
        );
      });
      console.log("\n");
    });
    return ReturnList;
  } catch (error) {
    console.error("Error:", error);
  }
}

const allocateAllStudents = async function (req, res) {
  try {
    console.log("admission");
    const admission = await db.sequelize.query(
      "SELECT ad.* FROM admission AS ad;",
      { type: db.sequelize.QueryTypes.SELECT }
    );
    console.log(admission);
    const result = await allocateStudents(admission);
    for (const admissionRecord of result) {
      await db.sequelize.query("CALL processAdmission(:admissionId)", {
        replacements: { admissionId: admissionRecord.id },
        type: db.sequelize.QueryTypes.SELECT,
      });
    }
    return ReS(res, { result: result });
  } catch (err) {
    console.log(err);
    return ReE(res, err, 422);
  }
};

module.exports.allocateAllStudents = allocateAllStudents;

const allocatStudentsByClassOld = async function (req, res) {
  try {
    let classId = req.params.classId;
    const admission = await db.sequelize.query(
      "SELECT ad.* FROM admission AS ad where ad.classId=" + classId,
      { type: db.sequelize.QueryTypes.SELECT }
    );

    const result = await allocateStudents(admission);
    // console.log(result);
    // return;
    result.forEach(async (admissionRecord) => {
      console.log(admissionRecord);
      try {
        let queryResult = await db.sequelize.query(
          "CALL processAdmission(:admissionId, :divisionId, :rollNo, :studentId)",
          {
            replacements: {
              admissionId: admissionRecord.id,
              divisionId: admissionRecord.divId,
              rollNo: admissionRecord.rollNo,
              studentId: admissionRecord.studentId,
            },
            type: db.sequelize.QueryTypes.SELECT,
          }
        );
        console.log(queryResult);
      } catch (err) {
        console.log(err);
      }
    });

    return ReS(res, { result: result });
  } catch (err) {
    console.log(err);
    return ReE(res, err, 422);
  }
};

module.exports.allocatStudentsByClassOld = allocatStudentsByClassOld;

const allocatStudentsByClass = async function (req, res) {
  try {
    let classId = req.params.classId;

    // Fetch admission records for the given classId
    const admission = await db.sequelize.query(
      "SELECT ad.* FROM admission AS ad WHERE ad.classId = :classId AND YEAR(ad.createdAt) = YEAR(CURRENT_DATE())",
      {
        replacements: { classId },
        type: db.sequelize.QueryTypes.SELECT,
      }
    );

    const result = await allocateStudents(admission);

    // Iterate through each admission record and process admission
    for (const admissionRecord of result) {
      try {
        let studentId;

        // Check if studentId is provided
        if (admissionRecord.studentId) {
          // Update existing student record
          // Update existing student record
          await db.sequelize.query(
            `
                    UPDATE student
                    SET
                        firstName = '${admissionRecord.firstName}',
                        middleName = '${admissionRecord.middleName}',
                        lastName = '${admissionRecord.lastName}',
                        gender = ${admissionRecord.gender},
                        dateOfBirth = '${admissionRecord.dateOfBirth}',
                        classId = ${admissionRecord.classId},
                        divId = ${admissionRecord.divId},
                        rollNo = ${admissionRecord.rollNo},
                        motherName = '${admissionRecord.motherName}',
                        motherQual = '${admissionRecord.motherQual}',
                        motherProf = '${admissionRecord.motherProf}',
                        fatherName = '${admissionRecord.fatherName}',
                        fatherQual = '${admissionRecord.fatherQual}',
                        fatherProf = '${admissionRecord.fatherProf}',
                        parentNumber = '${admissionRecord.parentNumber}',
                        parentNumberSecond = '${admissionRecord.parentNumberSecond}',
                        nationality = '${admissionRecord.nationality}',
                        religion = '${admissionRecord.religion}',
                        caste = '${admissionRecord.caste}',
                        bloodGroup = '${admissionRecord.bloodGroup}',
                        address = '${admissionRecord.address}',
                        cityId = ${admissionRecord.cityId},
                        stateId = ${admissionRecord.stateId},
                        pincode = ${admissionRecord.pincode},
                        updatedAt = CURRENT_TIMESTAMP
                    WHERE id = ${admissionRecord.studentId}
                    `,
            {
              type: db.sequelize.QueryTypes.UPDATE,
            }
          );
        } else {
          // Insert new student record
          const [insertResult] = await db.sequelize.query(
            `
                  INSERT INTO student (
                      firstName,
                      middleName,
                      lastName,
                      gender,
                      dateOfBirth,
                      classId,
                      divId,
                      rollNo,
                      motherName,
                      motherQual,
                      motherProf,
                      fatherName,
                      fatherQual,
                      fatherProf,
                      parentNumber,
                      parentNumberSecond,
                      nationality,
                      religion,
                      caste,
                      bloodGroup,
                      address,
                      cityId,
                      stateId,
                      pincode,
                      prevClassDiv,
                      createdAt,
                      createdBy,
                      updatedAt,
                      updatedBy,
                      active
                  )
                  VALUES (
                      '${admissionRecord.firstName}',
                      '${admissionRecord.middleName}',
                      '${admissionRecord.lastName}',
                      ${admissionRecord.gender},
                      '${admissionRecord.dateOfBirth}',
                      ${admissionRecord.classId},
                      ${admissionRecord.divId},
                      ${admissionRecord.rollNo},
                      '${admissionRecord.motherName}',
                      '${admissionRecord.motherQual}',
                      '${admissionRecord.motherProf}',
                      '${admissionRecord.fatherName}',
                      '${admissionRecord.fatherQual}',
                      '${admissionRecord.fatherProf}',
                      '${admissionRecord.parentNumber}',
                      '${admissionRecord.parentNumberSecond}',
                      '${admissionRecord.nationality}',
                      '${admissionRecord.religion}',
                      '${admissionRecord.caste}',
                      '${admissionRecord.bloodGroup}',
                      '${admissionRecord.address}',
                      ${admissionRecord.cityId},
                      ${admissionRecord.stateId},
                      ${admissionRecord.pincode},
                      '',
                      CURRENT_TIMESTAMP,
                      1,
                      CURRENT_TIMESTAMP,
                      1,
                      1
                  );
              `,
            {
              type: db.sequelize.QueryTypes.INSERT,
            }
          );
          console.log("insertResult");
          console.log(insertResult);
          // Get the ID of the newly inserted student record
          studentId = insertResult;
        }

        // Update isallocated, studentId, divisionId, and rollNo in the admission table
        // Update isallocated, studentId, divisionId, and rollNo in the admission table
        await db.sequelize.query(
          `
              UPDATE admission
              SET isallocated = 1, studentId = ${
                studentId !== null ? ":studentId" : "NULL"
              }, divId = :divisionId, rollNo = :rollNo
              WHERE id = :admissionId
              `,
          {
            replacements: {
              admissionId: admissionRecord.id,
              studentId: studentId || admissionRecord.studentId,
              divisionId: admissionRecord.divId,
              rollNo: admissionRecord.rollNo,
            },
            type: db.sequelize.QueryTypes.UPDATE,
          }
        );

        await db.sequelize.query(
          `
                  UPDATE feespaidbystudent
                  SET studentId = ${studentId !== null ? ":studentId" : "NULL"},
                  divId = :divisionId,
                  classId = :classId,
                  admissionId = :admissionId
                  WHERE paymentId = :paymentId
                  `,
          {
            replacements: {
              admissionId: admissionRecord.id,
              studentId: studentId || admissionRecord.studentId,
              divisionId: admissionRecord.divId,
              classId: admissionRecord.classId,
              paymentId: admissionRecord.paymentId,
            },
            type: db.sequelize.QueryTypes.UPDATE,
          }
        );
      } catch (err) {
        console.log(err);
      }
    }

    return ReS(res, { result });
  } catch (err) {
    console.log(err);
    return ReE(res, err, 422);
  }
};

module.exports.allocatStudentsByClass = allocatStudentsByClass;
