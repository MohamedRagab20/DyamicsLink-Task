﻿using Invoice.Data.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Invoice.Service
{
    public interface IStoreService
    {
        IEnumerable<Stores> GetStores();
    }
}