const db = require("../data/db-config");

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where({ id: id });
}

function add(schemesData) {
  return db("schemes").insert(schemesData);
}

function update(changes, id) {
  return db("schemes").where({ id: id }).update(changes);
}

function findSteps(id) {
  return db("schemes as s")
    .join("steps as st", "s.id", "st.scheme_id")
    .where({ scheme_id: id })
    .orderBy("st.step_number")
    .select("st.id", "s.scheme_name", "st.step_number", "st.instructions");
}

function remove(id) {
  return db("schemes").where({ id: id }).del();
}

function addStep(step, scheme_id) {
  return db("steps").insert({ ...step, scheme_id: scheme_id });
}

module.exports = {
  find,
  findById,
  add,
  update,
  findSteps,
  remove,
  addStep,
};
